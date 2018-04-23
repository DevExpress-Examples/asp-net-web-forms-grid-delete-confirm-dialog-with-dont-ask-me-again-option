using System;
using System.Collections.Generic;
using System.Web;
using System.Web.SessionState;
using System.ComponentModel;

public class DataRow {
    private int fId;
    private string fDescription;

	public DataRow(int id, string description){
        fId = id;
        fDescription = description;
    }

    public int ID {
        get { return fId; }
        set { fId = value; }
    }

    public string Description {
        get { return fDescription;}
        set { fDescription = value; } 
    }
}

public class GridDataSource {
    HttpSessionState Session { get { return HttpContext.Current.Session; } }

    public BindingList<DataRow> GetRows() {
        if (Session["GridDataSource"] == null) CreateRows();
        return Session["GridDataSource"] as BindingList<DataRow>;
    }

    public void CreateRows() {
        BindingList<DataRow> res = new BindingList<DataRow>();
        for (int i = 1; i <= 25; i++){
            DataRow item = new DataRow(i, "Sample data for row " + i);
            res.Add(item);
        }
        Session["GridDataSource"] = res;
    }
    
    public void DeleteRow(int id) {
        BindingList<DataRow> rows = Session["GridDataSource"] as BindingList<DataRow>;
        for (int i = 0; i < rows.Count; i++) {
            if (rows[i].ID == id){
                rows.Remove(rows[i]);
                break;
            }
        }
    }
}