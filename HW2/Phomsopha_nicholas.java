import java.io.FileNotFoundException;
import java.io.File;
import java.util.Scanner;
public class Phomsopha_nicholas {
    public static void computeFees(Student[] data) {
        int total_financialfees = 0;
        int total_nofinancialfees = 0;
        int total_csfees = 0;
        int total_ssfees = 0;
        int total_fees = 0;
        System.out.println("Summary of student fees assessed:\n");
        for(int i = 0;i<data.length;i++){
            // checks what subclass student is in degree seeking as well as non degree seeking
            if(data[i].getclass() == "DSSAID") {
                total_financialfees = total_financialfees + (int) data[i].getfees();
            } else if (data[i].getclass() == "DSSNOAID") {
                total_nofinancialfees = total_nofinancialfees + (int) data[i].getfees();
            } else if (data[i].getclass() == "CSStudent") {
                total_csfees = total_csfees + (int) data[i].getfees();
            } else if (data[i].getclass() == "SeniorStudent") {
                total_ssfees = total_ssfees + (int) data[i].getfees();
            }
        }
        total_fees = total_financialfees + total_nofinancialfees + total_ssfees + total_csfees;
        System.out.printf("Degree-seeking students without financial assistance: $%d\n",total_nofinancialfees);
        System.out.printf("Degree-seeking students with financial assistance: $%d\n",total_financialfees);
        System.out.printf("Certificate students: $%d\n",total_csfees);
        System.out.printf("Senior citizens: $%d\n\n",total_ssfees);
        System.out.printf("Total fees assessed: $%d\n",total_fees);

    }
    public static void PrintData(Student[] data) {
        System.out.println("Printing data for report 1.");
        for(int i = 0; i< data.length; i++){
            System.out.printf("%s %s $%.0f",data[i].getfirstname(),data[i].getlastname(),data[i].getfees());
            System.out.print("\n");
        }


    }
    public static void main(String[] args) throws FileNotFoundException {

        String filename = args[0];
        int index = 0;
        int size = 0;
        System.out.println("Reading Data....");
        File preread = new File("test.txt");
        Scanner prescan = new Scanner(preread);
        //gets array size and init student interface with it
        String prescanstring = "";
        while (prescan.hasNextLine()) {
            prescanstring = prescan.nextLine();
            size++;
        }
        prescan.reset();
        Student [] students = new Student[size];
        File file = new File(filename);
        Scanner scan = new Scanner(file);
        String input =  "";
        while (scan.hasNextLine()) {
            input = scan.nextLine();
            String[] tokens = input.split(";");
           String studentid = tokens[0];
           // creates class refrence array based on text line
           if ( tokens[5].equals("Y")) {
               students[index] = new DegreeSeekingStudents(tokens);
           }
           else {
                students[index] = new NonDegreeStudents(tokens);
           }
            index++;
            //System.out.println(scan.nextLine());
        }
        computeFees(students);
        PrintData(students);

    }

    public interface Student {
        String getstudentid();
        String getfirstname();
        String getlastname();
        String getage();
        String getcredits();
        String getmajor();
        String getaidstatus();
        String getacademicstatus();
        double getfees();
        String getclass();

    }
    public static class DegreeSeekingStudents implements Student {
        private String studentid;
        private String age;
        private String credits;
        private String firstname;
        private double fees;
        private double financial_aid = 0;
        private String lastname;
        private String major;
        private String aidstatus;
        private String academicstatus;
        private String classtatus;
        public DegreeSeekingStudents(String [] input)
        {
           // System.out.println(" A Degree Seeking student has been added");
            // set student major
            setmajor(input[6]);
            setAcademicstatus(input[7]);
            studentid = input[0];
            firstname =  input[1];
            lastname = input[2];
            age = input[3];
            credits = input[4];
            // checks tokens to see which subclass students should be in and creats it
            if (input[8].equals("Y")) {

                DSSaid student_aid = new DSSaid(input);
                fees = student_aid.calculate_cost();
                financial_aid = Double.parseDouble(input[9]);
                //classtatus = "degree-seeking";
                aidstatus = String.format("%s receives %.1f in financial assistance per term",firstname,financial_aid);
                classtatus = student_aid.setstatus();
            }
            else {
                DSSNOAid student = new DSSNOAid(input);
                fees = student.calculate_cost();
               // classtatus = "non degree-seeking";
                aidstatus = String.format("%s receives no financial assistance ",firstname);
                classtatus = student.setstatus();
            }
        }

        public DegreeSeekingStudents() {

        }

        public String getstudentid() {
            return  studentid;

        }
        public  String getage() {
            return age;
        }

        public  String getcredits() {
            return credits;
        }
        public String getfirstname() {
            return firstname;
        }
        public String getlastname() {
            return lastname;
        }
        public  double getfees() {
            return fees;
        }
        public String getaidstatus() {
            return aidstatus;
        }
        public String getacademicstatus() {
            return academicstatus;
        }
        public String getmajor() {
            return major;
        }
        public String getclass() {
            return classtatus;
        }
        public void setmajor(String M) {
            switch (M) {
                case "S":
                    major = "gaming Science";
                    break;
                case "M":
                    major = "hotel Managment";
                    break;
                case "A":
                    major = "lounge Arts";
                    break;
                case "E":
                    major = "beverage Engineering";
                    break;
                default:
                    major = "major not valid, what are you doing here?";
                    break;
            }
        }
        public void setAcademicstatus(String A) {
            switch (A) {
                case "G":
                    academicstatus = "Good";
                    break;
                case "W":
                    academicstatus = "Warning";
                    break;
                case "P":
                    academicstatus = "Probation";
                    break;
                default:
                    academicstatus = "Not Found";
                    break;
            }

        }
    }
    public static class NonDegreeStudents implements Student {
        private String studentid;
        private String age;
        private String credits;
        private String firstname;
        private String lastname;
        private double fees;
        private String major;
        private String aidstatus;
        private String academicstatus;
        private String classtatus;
        public NonDegreeStudents (String [] input)
        {
           // System.out.println(" A  NON Degree Seeking student has been added");
            studentid = input[0];
            firstname =  input[1];
            lastname = input[2];
            age = input[3];
            credits = input[4];
            classtatus = "non degree-seeking";
            academicstatus = "not applicable";
            // checks and creats sub class for students
            if (input[6].equals("C")) {
                // passes tokens into new class
                Certificate_student student = new Certificate_student(input);
                classtatus = student.setstatus();
               // setmajor(input[7]);
                fees = student.calculate_cost();
                aidstatus = String.format("%s  receives no financial assistance ",firstname);
            } else {
                Senior_citizens student = new Senior_citizens(input);
                classtatus = student.setstatus();
               // major = " major choice is not valid for a senior citizen";
                fees = student.calculate_cost();
                aidstatus = String.format("%s  receives no financial assistance ",firstname);
            }

        }

        public NonDegreeStudents() {

        }
        public String getclass() {
            return classtatus;
        }
        public String getstudentid() {
            return  studentid;
        }
        public  String getage() {
            return age;
        }
        public  String getcredits() {
            return credits;
        }
        public String getfirstname() {
            return firstname;
        }
        public String getlastname() {
            return lastname;
        }
        public double getfees() {
            return fees;
        }
        public String getaidstatus() {
            return aidstatus;
        }
        public String getacademicstatus() {
            return academicstatus;
        }
        public String getmajor() {
            return major;
        }
        public  void setmajor(String M) {
            switch (M) {
                case "S":
                    major = "gaming Science";
                    break;
                case "M":
                    major = "hotel Managment";
                    break;
                case "A":
                    major = "lounge Arts";
                    break;
                case "E":
                    major = "beverage Engineering";
                    break;
                default:
                    major = "major not valid, what are you doing here?";
                    break;
            }
        }
    }

    public  static class DSSNOAid extends DegreeSeekingStudents {
        static int recreation_fee = 100;
        static int union_fee = 50;
        static int credit_fee = 275;
        int credits = 0;
        public DSSNOAid( String [] inputs) {
            super();
        //    System.out.println("no aid has been created");
            credits = Integer.parseInt(inputs[4]);
        }
        public double calculate_cost() {
            return recreation_fee + union_fee + credit_fee * credits;
        }
        public String setstatus() {
            return "DSSNOAID";
        }

    }
    public  static class DSSaid extends DegreeSeekingStudents {
        static int recreation_fee = 100;
        static int union_fee = 50;
        static int credit_fee = 275;
        int credits = 0;
        double cost = 0;
        double financial_aid_amount = 0;
        double total_cost = 0;
        public DSSaid(String [] inputs) {
            super();
             financial_aid_amount = Double.parseDouble(inputs[9]);
             credits = Integer.parseInt(inputs[4]);
        //    System.out.println(" aid has been created");
        }
        public double calculate_cost() {
            cost = recreation_fee + union_fee + credit_fee * credits;
            total_cost = cost - financial_aid_amount;
            if( total_cost < 0 ) {
                return 0;
            }
            else {
                return total_cost;
            }
        }
        public String setstatus() {
            return "DSSAID";
        }



    }
    public static class Certificate_student extends NonDegreeStudents {
        static int Assesment_fee = 700;
        static int credit_fee = 300;
        int credits = 0;
        public Certificate_student(String[] input) {
            super();
        //    System.out.println("Certificate student added");
            credits = Integer.parseInt(input[4]);
        }
        public double calculate_cost() {
            return Assesment_fee + credit_fee * credits;
        }
        public String setstatus() {
            return "CSStudent";
        }
    }
    public static class Senior_citizens extends NonDegreeStudents {
        static int assesment_fee = 100;
        static int credit_fee = 50;
        int credits = 0;
        public Senior_citizens(String[] input) {
            super();
        //    System.out.println("Senior student added");
            credits = Integer.parseInt(input[4]);
        }
        public double calculate_cost() {
            return assesment_fee + credit_fee * credits;

        }
        public String setstatus() {
            return "SeniorStudent";
        }
    }



}
