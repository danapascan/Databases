package ScoalaSoferi;

import javax.swing.*;
import java.awt.image.BufferedImage;
import java.io.File;
import javax.swing.border.Border;
import javax.imageio.ImageIO;

import com.mysql.cj.jdbc.result.ResultSetMetaData;

import java.awt.*;
import java.awt.event.*;
import java.sql.*;
import java.util.Vector;

public class Meniu  extends JFrame implements ActionListener {
    private static final Color Color = null;

	JPanel general = new JPanel();
	JPanel total= new JPanel();
  
    JPanel titlu= new JPanel(new GridBagLayout());
    JPanel buton= new JPanel();
    JFrame f= new JFrame();
    
    JCheckBox Check1 = new JCheckBox("Interogare 1", false);
    JCheckBox Check2 = new JCheckBox("Interogare 2",false);
    JCheckBox Check3 = new JCheckBox("Interogare 3",false);
    JCheckBox Check4 = new JCheckBox("Interogare 4",false);
    JCheckBox Check5 = new JCheckBox("Interogare 5",false);
    JCheckBox Check6 = new JCheckBox("Interogare 6",false);
    JCheckBox Check7 = new JCheckBox("Interogare 7",false);
    JCheckBox Check8 = new JCheckBox("Interogare 8",false);
    
    ButtonGroup cbg = new ButtonGroup();

    JLabel meniu = new JLabel("Meniu");
       
    JButton selectBtn = new JButton("Select");
    
    Color c = new Color(100,149,237);
    Color c2 = new Color(25,25,112);    
    Color c3 = new Color(173,216,230);
    
    Border border = BorderFactory.createLineBorder(c3);
    
    
    JPanel panelImage= new JPanel();
    JLabel imageLabel= new JLabel();
	ImageIcon image= new ImageIcon();
    
    public Meniu(){
    	
    
        f.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        f.setSize(800,450);
        f.setTitle("Scoala de Soferi");

        Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
        int x = (int) ((dimension.getWidth() - this.getWidth()) /5);
        int y = (int) ((dimension.getHeight() - this.getHeight()) /5);
        f.setLocation(x, y);

		
	
		panelImage.setBounds(200, 0, 300, 400);
	    panelImage.setBackground(c);
	    try
	    {
		    image = new ImageIcon(getClass().getResource("instructorautodeva_400.png"));
		    imageLabel = new JLabel(image);
		    panelImage.add(imageLabel);
	    }
	    catch(Exception e)
	    {
		    System.out.println("Image cannot be found!");
		    }
	   
		  meniu.setBounds(100, 100, 50, 50); 
		  meniu.setFont(new Font("TimesNewRoman", Font.BOLD, 40));
		  meniu.setForeground(c2);
		  //meniu.setHorizontalAlignment(SwingConstants.LEFT);
		  titlu.setSize(new Dimension(50,300));
		  titlu.add(meniu);
		  titlu.setBackground(c);
		  
		  Check1.setBackground(c);
		  Check2.setBackground(c);
		  Check3.setBackground(c);
		  Check4.setBackground(c);
		  Check5.setBackground(c);
		  Check6.setBackground(c);
		  Check7.setBackground(c);
		  Check8.setBackground(c);
		  
		  Check1.setForeground(c2);
		  Check2.setForeground(c2);
		  Check3.setForeground(c2);
		  Check4.setForeground(c2);
		  Check5.setForeground(c2);
		  Check6.setForeground(c2);
		  Check7.setForeground(c2);
		  Check8.setForeground(c2);
		  
		  Check1.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check2.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check3.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check4.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check5.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check6.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check7.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  Check8.setFont(new Font("TimesNewRoman", Font.BOLD, 16));
		  
		  cbg.add(Check1);
		  cbg.add(Check2);
		  cbg.add(Check3);
		  cbg.add(Check4);
		  cbg.add(Check5);
		  cbg.add(Check6);
		  cbg.add(Check7);
		  cbg.add(Check8);
		  
          selectBtn.setBounds(200, 200, 90, 40);
          selectBtn.setPreferredSize(new Dimension(80, 40));
		  selectBtn.setBorder(border); 
		  selectBtn.addActionListener(this);
		  selectBtn.setBackground(c2);
		  selectBtn.setForeground(Color.WHITE);
		  selectBtn.setFont(new Font("TimesNewRoman", Font.BOLD, 20));
		  selectBtn.setHorizontalAlignment(SwingConstants.CENTER);
		  
		  buton.add(selectBtn);
		  buton.setBackground(c);
		  
        BoxLayout boxYLayout = new BoxLayout(general, BoxLayout.Y_AXIS);
        
		  general.add(titlu); 
		  general.add(Check1);
		  general.add(Check2);
		  general.add(Check3);
		  general.add(Check4);
		  general.add(Check5);
		  general.add(Check6);
		  general.add(Check7);
		  general.add(Check8);
          add(general);
          general.add(buton);
          general.setBackground(c);
          general.setLayout(boxYLayout);
          
          BoxLayout boxXLayout2 = new BoxLayout(total, BoxLayout.X_AXIS);
          total.add(general);
          total.add(panelImage);
           
        total.setLayout(boxXLayout2);
        f.setContentPane(total);
        f.setBackground(c);
        f.setVisible(true);
        
    }
	@Override
	public void actionPerformed(ActionEvent e) {
		  if (e.getSource() == selectBtn)
	        {
			  if (Check1.isSelected()) {
	            f.setVisible(false);
	            Interogare1 sgn = new Interogare1();
	            }
			  if (Check2.isSelected()) {
		            f.setVisible(false);
		            Interogare2 sgn = new Interogare2();
		            }
			  if (Check3.isSelected()) {
		            f.setVisible(false);
		            Interogare3 sgn = new Interogare3();
		            }
			  if (Check4.isSelected()) {
		            f.setVisible(false);
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
	                    selectStatement1.execute("SELECT DISTINCT LEAST(c1.ID_C, c2.ID_C) AS \"Chestionar1\" , GREATEST(c1.ID_C, c2.ID_C) AS \"Chestionar2\"\r\n"
	                    		+ "FROM  Intrebari_Chestionar  c1 JOIN  Intrebari_Chestionar c2 ON (c1.ID_I=c2.ID_I)\r\n"
	                    		+ "WHERE c1.ID_C <> c2. ID_C AND c1.ID_I=c2.ID_I AND c1.NR_ORDINE=c2.NR_ORDINE");
	                    rs1 = selectStatement1.getResultSet();
	                    md=(ResultSetMetaData) rs1.getMetaData();
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
	                    
	                    new Interogare4(Data, ColumnNames);
	                    
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
			  if (Check5.isSelected()) {
		            f.setVisible(false);
		            Interogare5 sgn = new Interogare5();
		            }
			  if (Check6.isSelected()) {
		            f.setVisible(false);
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
	                    selectStatement1.execute("SELECT ID_T, PUNCTAJ\r\n"
	                    		+ "FROM Test\r\n"
	                    		+ "WHERE PUNCTAJ >=ALL( SELECT PUNCTAJ \r\n"
	                    		+ "FROM Test)");
	                    rs1 = selectStatement1.getResultSet();
	                    md=(ResultSetMetaData) rs1.getMetaData();
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
	                    
	                    new Interogare6(Data, ColumnNames);
	                    
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
			  if (Check7.isSelected()) {
		            f.setVisible(false);
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
	                    selectStatement1.execute("SELECT COUNT( ID_C) AS \"Numărul chestionarelor\" \r\n"
	                    		+ "FROM Chestionar\r\n"
	                    		+ "WHERE PUNCTAJ_MAX=(SELECT MIN(PUNCTAJ_MAX) FROM Chestionar)");
	                    rs1 = selectStatement1.getResultSet();
	                    md=(ResultSetMetaData) rs1.getMetaData();
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
	                    
	                    new Interogare7(Data, ColumnNames);
	                    
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
			  if (Check8.isSelected()) {
		            f.setVisible(false);
		            Interogare8 sgn = new Interogare8();
		            }
	        }
		
	}
}