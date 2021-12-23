package edu.ucan.medical.model;

/**
 * @author tio-hecro
 */
public class Region {
    private int pkRegion;
    private String nome;
    private int fkRegion;

    public Region() {}

    public Region(int pkRegion, String nome, int fkRegion) {
        this.pkRegion = pkRegion;
        this.nome = nome;
        this.fkRegion = fkRegion;
    }

    public int getPkRegion() {
        return pkRegion;
    }

    public void setPkRegion(int pkRegion) {
        this.pkRegion = pkRegion;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public int getFkRegion() {
        return fkRegion;
    }

    public void setFkRegion(int fkRegion) {
        this.fkRegion = fkRegion;
    }

    @Override
    public String toString() {
        return "Region{" + "pkRegion=" + pkRegion + ", nome=" + nome + ", fkRegion=" + fkRegion + '}';
    }   
}
