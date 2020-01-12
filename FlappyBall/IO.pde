BufferedWriter out;
File writename = new File("./rank.txt"); 
File readfileName = new File("./rank.txt");
public class Out {
  void init() {
    try{
     writename.createNewFile();  
     out = new BufferedWriter(new FileWriter(writename)); 
    } catch(Exception e) {
      System.out.println("fail to update");
    }
  }
  void cout(String res) {
      try {
        out.write(res+"\r\n");
        //println(res+"\r\n");
        out.flush();
      } catch (Exception e) {  
        System.out.println("fail to write.");  
      }
   }
   void end() {
     try {
       out.close();
     } catch (Exception e) {  
       System.out.println("fail to close");  
     }
   }
}

public class In {
   String name;
    void read() {
        BufferedReader reader = null;
        try {
            reader = new BufferedReader(new FileReader(readfileName));
            String tempString = null;
            int line = 1;
            while ((tempString = reader.readLine()) != null) {
                //System.out.println(tempString);
                if(line <= 5) {
                  sa.grade[line] = Integer.valueOf(tempString);
                  line++;
                  continue;
                }
                if(line % 2 == 0) name = tempString;
                else n.map.put(name, Integer.valueOf(tempString));
                line++;
            }
            reader.close();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (reader != null) {
                try {
                    reader.close();
                } catch (IOException e1) {
                }
            }
        }
    }
}
