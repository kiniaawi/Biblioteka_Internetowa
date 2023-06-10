package Servlet;

public class KlasyKsiazki {
    private int id;
    private String tytul; 
    private String autor;
    private String rok;
    private String opis;
    private int szt;
    private String obraz;
 
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
    public String getTytul() {
        return tytul;
    }
 
    public void setTytul(String tytul) {
        this.tytul = tytul;
    }
 
    public String getAutor() {
        return autor;
    }
 
    public void setAutor(String autor) {
        this.autor = autor;
    }
    
    public String getRok() {
        return rok;
    }
 
    public void setRok(String rok) {
        this.rok = rok;
    }
    
    public String getOpis() {
        return opis;
    }
 
    public void setOpis(String opis) {
        this.opis = opis;
    }
    
    public int getSzt() {
        return szt;
    }
    
    public void setSzt(int szt) {
        this.szt = szt;
    }
    
     public String getObraz() {
        return obraz;
    }
 
    public void setObraz(String obraz) {
        this.obraz = obraz;
    }
    
}
