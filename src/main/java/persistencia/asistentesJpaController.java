package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.NoResultException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.asistentes;
import logica.usuarios;
import persistencia.exceptions.NonexistentEntityException;


public class asistentesJpaController implements Serializable {

    public asistentesJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

        public asistentesJpaController() {
        emf = Persistence.createEntityManagerFactory("BdentalPU");
    }
    public void create(asistentes asistentes) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(asistentes);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(asistentes asistentes) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            asistentes = em.merge(asistentes);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = asistentes.getIdAsistente();
                if (findasistentes(id) == null) {
                    throw new NonexistentEntityException("The asistentes with id " + id + " no longer exists.");
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
            asistentes asistentes;
            try {
                asistentes = em.getReference(asistentes.class, id);
                asistentes.getIdAsistente();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The asistentes with id " + id + " no longer exists.", enfe);
            }
            em.remove(asistentes);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<asistentes> findasistentesEntities() {
        return findasistentesEntities(true, -1, -1);
    }

    public List<asistentes> findasistentesEntities(int maxResults, int firstResult) {
        return findasistentesEntities(false, maxResults, firstResult);
    }

    private List<asistentes> findasistentesEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(asistentes.class));
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

    public asistentes findasistentes(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(asistentes.class, id);
        } finally {
            em.close();
        }
    }

    public int getasistentesCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<asistentes> rt = cq.from(asistentes.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
    public usuarios findUsuarioByAsistentes(int idAsistentes) {
        EntityManager em = getEntityManager();
        try {
            Query query = em.createQuery("SELECT a.usuario FROM asistentes a WHERE a.idAsistente = :id");
            query.setParameter("id", idAsistentes);
            return (usuarios) query.getSingleResult();
        } catch (NoResultException e) {
            return null;
        } finally {
            em.close();
        }
    }
    
}
