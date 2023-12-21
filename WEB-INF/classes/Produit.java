package mesclass;

import java.sql.*;
import java.util.Vector;

public class Produit {
    int idProduit;
    String nomProduit;
    double prix;
    Timestamp dateProduit;
    int typeProduit;
    int categorie;
    String nomType;
    String nomCategorie; 

    public int getIdProduit() {
        return idProduit;
    }

    public void setIdProduit(int idProduit) {
        this.idProduit = idProduit;
    }

    public String getNomProduit() {
        return nomProduit;
    }

    public void setNomProduit(String nomProduit) {
        this.nomProduit = nomProduit;
    }

    public double getPrix() {
        return prix;
    }

    public void setPrix(double prix) {
        this.prix = prix;
    }

    public Timestamp getDateProduit() {
        return dateProduit;
    }

    public void setDateProduit(Timestamp dateProduit) {
        this.dateProduit = dateProduit;
    }

    public int getTypeProduit() {
        return typeProduit;
    }

    public void setTypeProduit(int typeProduit) {
        this.typeProduit = typeProduit;
    }

    public int getCategorie() {
        return categorie;
    }

    public void setCategorie(int categorie) {
        this.categorie = categorie;
    }

    public String getNomType() {
        return nomType;
    }

    public void setNomType(String nomType) {
        this.nomType = nomType;
    }

    public String getNomCategorie() {
        return nomCategorie;
    }

    public void setNomCategorie(String nomCategorie) {
        this.nomCategorie = nomCategorie;
    }

    public Produit() {
    }

    public Produit(String nomProduit, double prix, Timestamp dateProduit, String nomType) {
        this.setNomProduit(nomProduit);
        this.setPrix(prix);
        this.setDateProduit(dateProduit);
        this.setNomType(nomType);
    }

    public Produit(String nomProduit, double prix,int categorie,String nomcategorie, Timestamp dateProduit, String nomType) {
        this.setNomProduit(nomProduit);
        this.setPrix(prix);
        this.setCategorie(categorie);
        this.setNomCategorie(nomcategorie);
        this.setDateProduit(dateProduit);
        this.setNomType(nomType);
    }

    public Produit(int idProduit, String nomProduit, double prix, Timestamp dateProduit, int typeProduit,
            int categorie) {
        this.setIdProduit(idProduit);
        this.setNomProduit(nomProduit);
        this.setPrix(prix);
        this.setDateProduit(dateProduit);
        this.setTypeProduit(typeProduit);
        this.setCategorie(categorie);
    }

    public Produit[] getProduit(Connection conn) throws Exception {
        Statement state = conn.createStatement();
        String req = "select * from v2_produits";
        ResultSet result = state.executeQuery(req);
        Vector all = new Vector();
        while (result.next()) {
            Produit p = new Produit(
                    result.getString(1),
                    result.getDouble(2),
                    result.getInt(3),
                    result.getString(4),
                    result.getTimestamp(5),
                    result.getString(6));
            all.add(p);
        }
        Produit[] produits=new Produit[all.size()];
        all.copyInto(produits);
        state.close();
        return produits;
    }

    /*public void insertProduit(Connection conn,String nomProduit, int Prix, String dateProduit, int typeProduit, int categorie)throws Exception{
        Statement state = conn.createStatement();
        StringBuilder req =new StringBuilder("INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES('").append(nomProduit).append("',").append(Prix).append(",TIMESTAMP'").append(dateProduit).append("',").append(typeProduit).append(",").append(categorie).append(")");
        state.executeQuery(req.toString());
        state.close();
        // System.out.println(req.toString());
        // return req.toString();
    }*/

        public void insertProduit(Connection conn,String nomProduit, int Prix, String dateProduit, int typeProduit, int categorie)throws Exception{
        Statement state = conn.createStatement();
        StringBuilder req =new StringBuilder("INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES('")
        .append(nomProduit)
        .append("',")
        .append(Prix*categorie)
        .append(",TIMESTAMP'")
        .append(dateProduit)
        .append("',")
        .append(typeProduit)
        .append(",")
        .append(categorie)
        .append(")");
        state.executeQuery(req.toString());
        state.close();
        // System.out.println(req.toString());
        // return req.toString();
    }

        public void insertProduitTableau(Connection conn,String nomProduit, int Prix, String dateProduit, int typeProduit, int categorie)throws Exception{
        Statement state = conn.createStatement();
        StringBuilder req =new StringBuilder("INSERT INTO Produits(nomProduit,prix,dateProduit,typeProduit,categorie) VALUES('")
        .append(nomProduit)
        .append("',")
        .append(Prix*categorie)
        .append(",TIMESTAMP'")
        .append(dateProduit)
        .append("',")
        .append(typeProduit)
        .append(",")
        .append(categorie)
        .append(")");
        state.executeQuery(req.toString());
        state.close();
        //System.out.println(req.toString());
        // return req.toString();
    }

}

