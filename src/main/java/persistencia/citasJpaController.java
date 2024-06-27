package persistencia;

import java.io.Serializable;
import java.util.List;
import java.util.Date;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.citas;
import persistencia.exceptions.NonexistentEntityException;

public class citasJpaController implements Serializable {

    public citasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public citasJpaController() {
        emf = Persistence.createEntityManagerFactory("BdentalPU");
    }

    public void create(citas citas) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(citas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(citas citas) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            citas = em.merge(citas);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = citas.getIdCita();
                if (findcitas(id) == null) {
                    throw new NonexistentEntityException("The citas with id " + id + " no longer exists.");
                }
            }
            throw ex;
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void destroy(int id) throws NonexistentEntityException {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            citas citas;
            try {
                citas = em.getReference(citas.class, id);
                citas.getIdCita();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The citas with id " + id + " no longer exists.", enfe);
            }
            em.remove(citas);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<citas> findcitasEntities() {
        return findcitasEntities(true, -1, -1);
    }

    public List<citas> findcitasEntities(int maxResults, int firstResult) {
        return findcitasEntities(false, maxResults, firstResult);
    }

    private List<citas> findcitasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(citas.class));
            Query q = em.createQuery(cq);
            if (!all) {
                q.setMaxResults(maxResults);
                q.setFirstResult(firstResult);
            }
            return q.getResultList();
        } finally {
            em.close();
        }
    }

    public citas findcitas(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(citas.class, id);
        } finally {
            em.close();
        }
    }

    public int getcitasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<citas> rt = cq.from(citas.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public List<citas> findCitasByDia(Date dia) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT c FROM citas c WHERE c.dia = :dia");
            query.setParameter("dia", dia);
            return query.getResultList();
        } finally {
            em.close();
        }
    }

    public boolean existeCita(int idCliente, Date fecha) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT COUNT(c) FROM citas c WHERE c.cliente.idCliente = :idCliente AND c.dia = :idDia");
            query.setParameter("idCliente", idCliente);
            query.setParameter("idDia", fecha);
            Long count = (Long) query.getSingleResult();
            return count > 0;
        } catch (NoResultException e) {
            return false;
        } finally {
            em.close();
        }
    }

    public Date getUltimaFechaCita(int idCliente) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT MAX(c.dia) FROM citas c WHERE c.cliente.idCliente = :idCliente");
            query.setParameter("idCliente", idCliente);
            return (Date) query.getSingleResult();
        } catch (NoResultException e) {
            return null; // Si no hay citas registradas para el cliente
        } finally {
            em.close();
        }

    }

    public Date getFechaUltimaCita(int idCliente) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Date> query = em.createQuery(
                    "SELECT MAX(c.dia) FROM citas c WHERE c.cliente.idCliente = :idCliente",
                    Date.class
            );
            query.setParameter("idCliente", idCliente);
            List<Date> results = query.getResultList();
            return results.isEmpty() ? null : results.get(0);
        } finally {
            em.close();
        }
    }

    public boolean existeCitaParaCliente(int idCliente) {
        EntityManager em = getEntityManager();
        try {
            TypedQuery<Long> query = em.createQuery(
                    "SELECT COUNT(c) FROM citas c WHERE  c.cliente.idCliente = :idCliente",
                    Long.class
            );
            query.setParameter("idCliente", idCliente);
            Long count = query.getSingleResult();
            return count > 0;
        } finally {
            em.close();
        }
    }
}
