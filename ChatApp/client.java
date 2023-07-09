import java.io.*;
import java.net.*;
import javax.swing.*;
import java.awt.event.*;

public class client extends JFrame implements ActionListener {
    JTextArea area;
    JTextField t1;
    JButton b1;
    String st = "", str = "";
    Socket s;
    PrintStream ps;
    BufferedReader br;

    client() throws Exception {
        area = new JTextArea("client\n", 50, 50);
        t1 = new JTextField();
        b1 = new JButton("Send");
        area.setBounds(20, 20, 300, 300);
        t1.setBounds(20, 320, 200, 20);
        b1.setBounds(230, 320, 70, 20);
        this.add(area);
        this.add(t1);
        this.add(b1);
        b1.addActionListener(this);
        setLayout(null);
        this.setSize(600, 500);
        this.setVisible(true);
        setDefaultCloseOperation(EXIT_ON_CLOSE);
        try {
            s = new Socket("localhost", 888);
            ps = new PrintStream(s.getOutputStream()); // to send data to server
            br = new BufferedReader(new InputStreamReader(s.getInputStream())); // data comes from server
        } catch (Exception er) {
            System.out.println(er);
        }
        while (true) {
            st = "\n" + br.readLine();
            str = area.getText();
            area.setText(str + st);
        }
    }

    public void actionPerformed(ActionEvent e) {
        String s = e.getActionCommand();
        if (s.equals("Send")) {
            st = ("\nclient: " + t1.getText());
            str = area.getText();
            area.setText(str + st);
            t1.setText("");
            try {
                ps.println(st);
            } catch (Exception ee) {
                System.out.println(ee);
            }
        }
    }

    public static void main(String[] args) throws Exception {
        new client();
    }
}