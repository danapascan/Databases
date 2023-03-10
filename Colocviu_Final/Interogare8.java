package ScoalaSoferi;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.Window;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.border.Border;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

//import com.mysql.cj.xdevapi.Statement;
import java.sql.Statement;
import java.util.Vector;

import javax.swing.*;

public class Interogare8 extends JFrame implements ActionListener {
	JPanel p = new JPanel();
    JTextField testTxt = new JTextField();  
    Color c = new Color(100,149,237);
 	Color c2 = new Color(25,25,112);
 	Color c3 = new Color(173,216,230);
 	
 	
    Border border = BorderFactory.createLineBorder(c3);
    JButton cautaBtn = new JButton("Caută");
    JLabel titlu= new JLabel("<html>Să se găsească numărul întrebărilor care au cel puțin <br> un răspuns model unde\r\n"
    		+ "corect = ’D/N’.</html>", SwingConstants.CENTER);
    
  
	public Interogare8()
	{
        this.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
	  	this.setSize(450, 350);
	    this.setTitle("Interogare 8");
	    
	    Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
        int x = (int) ((dimension.getWidth() - this.getWidth()) / 2);
        int y = (int) ((dimension.getHeight() - this.getHeight()) / 2);
        this.setLocation(x, y);
       
        titlu.setBounds((p.getWidth() - 200)/2, 10, 650, 50); 
		titlu.setFont(new Font("TimesnNewRoman", Font.BOLD, 14));
		titlu.setHorizontalAlignment(SwingConstants.CENTER);
    	titlu.setForeground(c2);
        p.add(titlu);
        
		testTxt.setBounds(100, 100, 250, 30);
        testTxt.setBorder(border);
        testTxt.setBackground(c3);

        p.add(testTxt);
        
        cautaBtn.setBounds((this.getWidth() - 80)/2, 200, 80, 30);
		cautaBtn.setBorder(border);
		cautaBtn.setBackground(c2);
		cautaBtn.setForeground(Color.WHITE);
		cautaBtn.setFont(new Font("TimesNewRoman", Font.PLAIN, 20));
		p.add(cautaBtn);
		p.setBackground(c);
		cautaBtn.addActionListener(this);
	
        this.setContentPane(p);
        this.setLayout(null);
        this.setVisible(true);
        
	}
        @Override
    	public void actionPerformed(ActionEvent e) {

            if(e.getSource() == cautaBtn)
            {
                this.setVisible(false);
                Connection connection = null;
                Statement selectStatement1 = null;
                ResultSet rs1 = null;
                ResultSetMetaData md=null;
                Vector ColumnNames= new Vector();
                Vector Data= new Vector();
                
                try {
                    connection = DriverManager.getConnection("jdbc:mysql://127.0.0.1/scoala_soferi?user=root&password=ACEGIF25&serverTimezone=UTC");
                    selectStatement1 = connection.createStatement();
                    selectStatement1.execute("SELECT COUNT(DISTINCT(Intrebare.ID_I)) AS \"Număr întrebări\"\r\n"
                    		+ "FROM Intrebare\r\n"
                    		+ " JOIN Raspuns ON( Intrebare.ID_I=Raspuns.ID_I)\r\n"
                    		+ "WHERE Raspuns.CORECT=\"" + testTxt.getText() +"\";" );
                    rs1 = selectStatement1.getResultSet();
                    md=(ResultSetMetaData) rs1.getMetaData();
                    if ( !rs1.isBeforeFirst())
                    {
                    	JOptionPane.showInternalMessageDialog(p, "Nu ați introdus litera corespunzătoare!", "EROARE", JOptionPane.WARNING_MESSAGE);
                    	
                    }
                    else {
                    int columns=md.getColumnCount();
                    for(int i=1;i<=columns;i++)
                    {
                    		ColumnNames.addElement(md.getColumnName(i));
                    }
                    while(rs1.next())
                    {
                    	Vector Row= new Vector(columns);
                    	for(int i=1;i<=columns;i++)
                    	{
                    		Row.addElement(rs1.getObject(i));
                    	}
                    
                    Data.addElement(Row);
                    }
                    
                    new Rezultat8(Data, ColumnNames);
                    }
                }
                catch(SQLException sqlex) {
                    System.err.println("An SQL Exception occured. Details are provided below:");
                    sqlex.printStackTrace(System.err);
                }
                finally {
                    if (rs1 != null) {
                        try {
                            rs1.close();
                        }
                        catch(SQLException e1) {
                        }
                        rs1 = null;
                    }
                    if (selectStatement1 != null) {
                        try {
                            selectStatement1.close();
                        }
                        catch(SQLException e1) {}
                        selectStatement1 = null;
                    }
                    if (connection != null) {
                        try {
                            connection.close();
                        }
                        catch(SQLException e1) {}
                        connection = null;
                    }
                }
    	}
	
        }
}