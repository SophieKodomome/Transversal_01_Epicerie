package affichage;

import java.sql.*;
import mesclass.*;
import connect.*;


public class Main {
    public static void main(String[] args) throws Exception {
        Connection conn = new Connect().connectit("epicerie", "epicerie", "epicerie");

        Produit p = new Produit();
        // for (int i = 0; i < p.getProduit(conn).length; i++) {
        //     System.out.println(p.getProduit(conn)[i].getIdProduit());
        // }
        // p.insertProduit(conn, "Colgate", 1500, "2023-12-25", 1, 3);
        Type t= new Type();
        // for(int i = 0; i<t.getType(conn).length; i++){
        //     System.out.println(t.getType(conn)[i].getIdType());
        // }
        p.insertProduit(conn, "Sel", 500, "2023-12-19", 2, 3);

    }
}
