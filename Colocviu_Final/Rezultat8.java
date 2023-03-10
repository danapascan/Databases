package ScoalaSoferi;

import java.awt.BorderLayout;
import java.awt.Color;
import java.awt.Dimension;
import java.awt.Font;
import java.awt.Toolkit;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import java.util.Vector;

import javax.swing.BorderFactory;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JLabel;
import javax.swing.JPanel;
import javax.swing.JScrollPane;
import javax.swing.JTable;
import javax.swing.SwingConstants;
import javax.swing.border.Border;
import javax.swing.table.TableColumn;

public class Rezultat8 extends JFrame implements ActionListener {

	JPanel p = new JPanel();
	 JFrame f;
	    JTable j;
	    JButton returnBtn = new JButton("Meniu");

	    Color c = new Color(100,149,237);
	 	Color c2 = new Color(25,25,112);
	 	Color c3 = new Color(173,216,230);
	 	
	 	   Border border = BorderFactory.createLineBorder(c2);
	 	  Border border1=BorderFactory.createLineBorder(c);
	 	  Border border2 =BorderFactory.createLineBorder(c3);
	 	   
	    Rezultat8(Vector Data, Vector ColumnNames)
	    {
	        f = new JFrame();
	        f.setTitle("Rezultat interogare 8");
	        j = new JTable(Data, ColumnNames);
	        j.setBounds(30, 40, 200, 300);
	        j.setBackground(c);
	        j.setForeground(c2);
	        j.setBorder(border);
	        j.setIntercellSpacing(new Dimension(0,0));
	        j.setGridColor(c2);
	        j.getTableHeader().setBackground(c3);
	        j.getTableHeader().setFont(new Font("TimesNewRoman", Font.BOLD, 20));
	        j.getTableHeader().setForeground(c2);
	        j.setCellSelectionEnabled(false);
	        j.setFont(new Font("TimesNewRoman", Font.BOLD, 15));
	      
	    returnBtn.setBounds(210, 300, 110, 30);
		returnBtn.setBorder(border); 
		returnBtn.setBackground(c2);
		returnBtn.setForeground(Color.WHITE);
		returnBtn.setFont(new Font("TimesNewRoman", Font.PLAIN, 20));
		returnBtn.setPreferredSize(new Dimension(100, 60));
		returnBtn.setBorder(border2);
		returnBtn.addActionListener(this);
		f.add(returnBtn);
		
		JScrollPane sp = new JScrollPane(j);
		sp.setBackground(c);
		sp.getViewport().setBackground(c);
		sp.setPreferredSize(new Dimension(500, 200));
		sp.setBorder(border1);
		p.add(sp);
		p.setBackground(c);
		
	        f.add(p);
	        f.setSize(540, 400);
	        Dimension dimension = Toolkit.getDefaultToolkit().getScreenSize();
	        int x = (int) ((dimension.getWidth() - this.getWidth()) /4);
	        int y = (int) ((dimension.getHeight() - this.getHeight()) /4);
	        f.setLocation(x, y);
	        f.setVisible(true);
	        
	        
	    }

		
	@Override
	public void actionPerformed(ActionEvent e) {
		if (e.getSource() == returnBtn)
        {
            f.setVisible(false);
            Meniu sgn = new Meniu();
        }
	

	}
}