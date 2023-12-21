package mesclass;

import java.sql.*;
import java.util.Vector;

public class Type {
    int idType;
    String nomType;

    public int getIdType() {
        return idType;
    }

    public void setIdType(int type) {
        idType = type;
    }

    public String getNomType() {
        return nomType;
    }

    public void setNomType(String nomType) {
        this.nomType = nomType;
    }

    public Type(int type, String nomType) {
        this.setIdType(type);
        this.setNomType(nomType);
    }

    public Type() {

    }

    public Type[] getType(Connection conn) throws Exception {
        Statement state = conn.createStatement();
        String req = "select * from typep";
        ResultSet result = state.executeQuery(req);
        Vector all = new Vector();
        while (result.next()) {
            Type t = new Type(
                    result.getInt(1),
                    result.getString(2));
            all.add(t);
        }
        Type[] typep = new Type[all.size()];
        all.copyInto(typep);
        state.close();
        return typep;
    }
}
