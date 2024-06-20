package persistencia;

import java.io.Serializable;
import java.sql.Date;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.horarios;
import logica.usuarios;
import persistencia.exceptions.NonexistentEntityException;

public class horariosJpaController implements Serializable {

    public horariosJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    public horariosJpaController() {
        emf = Persistence.createEntityManagerFactory("BdentalPU");
    }

    public void create(horarios horarios) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(horarios);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(horarios horarios) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            horarios = em.merge(horarios);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = horarios.getIdHorarios();
                if (findhorarios(id) == null) {
                    throw new NonexistentEntityException("The horarios with id " + id + " no longer exists.");
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
            horarios horarios;
            try {
                horarios = em.getReference(horarios.class, id);
                horarios.getIdHorarios();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The horarios with id " + id + " no longer exists.", enfe);
            }
            em.remove(horarios);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<horarios> findhorariosEntities() {
        return findhorariosEntities(true, -1, -1);
    }

    public List<horarios> findhorariosEntities(int maxResults, int firstResult) {
        return findhorariosEntities(false, maxResults, firstResult);
    }

    private List<horarios> findhorariosEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(horarios.class));
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

    public horarios findhorarios(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(horarios.class, id);
        } finally {
            em.close();
        }
    }

    public int gethorariosCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<horarios> rt = cq.from(horarios.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }

    public horarios findHorariosByFecha(Date fecha) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT h FROM horarios h WHERE h.fecha = :fecha");
            query.setParameter("fecha", fecha);
            return (horarios) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    public List<String> findDiasBloqueados() {
    EntityManager em = getEntityManager();
    try {
        Query query = em.createQuery("SELECT h.fecha FROM horarios h WHERE h.vigente = 0");
        return query.getResultList();
    } finally {
        em.close();
    }
}

}
