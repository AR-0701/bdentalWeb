package persistencia;

import java.io.Serializable;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Query;
import javax.persistence.EntityNotFoundException;
import javax.persistence.Persistence;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;
import logica.vigencias;
import persistencia.exceptions.NonexistentEntityException;

public class vigenciasJpaController implements Serializable {

    public vigenciasJpaController(EntityManagerFactory emf) {
        this.emf = emf;
    }
    private EntityManagerFactory emf = null;

    public EntityManager getEntityManager() {
        return emf.createEntityManager();
    }
  public vigenciasJpaController(){
        emf= Persistence.createEntityManagerFactory("BdentalPU");
    }
    public void create(vigencias vigencias) {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            em.persist(vigencias);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public void edit(vigencias vigencias) throws NonexistentEntityException, Exception {
        EntityManager em = null;
        try {
            em = getEntityManager();
            em.getTransaction().begin();
            vigencias = em.merge(vigencias);
            em.getTransaction().commit();
        } catch (Exception ex) {
            String msg = ex.getLocalizedMessage();
            if (msg == null || msg.length() == 0) {
                int id = vigencias.getIdDiaBloqueado();
                if (findvigencias(id) == null) {
                    throw new NonexistentEntityException("The vigencias with id " + id + " no longer exists.");
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
            vigencias vigencias;
            try {
                vigencias = em.getReference(vigencias.class, id);
                vigencias.getIdDiaBloqueado();
            } catch (EntityNotFoundException enfe) {
                throw new NonexistentEntityException("The vigencias with id " + id + " no longer exists.", enfe);
            }
            em.remove(vigencias);
            em.getTransaction().commit();
        } finally {
            if (em != null) {
                em.close();
            }
        }
    }

    public List<vigencias> findvigenciasEntities() {
        return findvigenciasEntities(true, -1, -1);
    }

    public List<vigencias> findvigenciasEntities(int maxResults, int firstResult) {
        return findvigenciasEntities(false, maxResults, firstResult);
    }

    private List<vigencias> findvigenciasEntities(boolean all, int maxResults, int firstResult) {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            cq.select(cq.from(vigencias.class));
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

    public vigencias findvigencias(int id) {
        EntityManager em = getEntityManager();
        try {
            return em.find(vigencias.class, id);
        } finally {
            em.close();
        }
    }

    public int getvigenciasCount() {
        EntityManager em = getEntityManager();
        try {
            CriteriaQuery cq = em.getCriteriaBuilder().createQuery();
            Root<vigencias> rt = cq.from(vigencias.class);
            cq.select(em.getCriteriaBuilder().count(rt));
            Query q = em.createQuery(cq);
            return ((Long) q.getSingleResult()).intValue();
        } finally {
            em.close();
        }
    }
    
}
