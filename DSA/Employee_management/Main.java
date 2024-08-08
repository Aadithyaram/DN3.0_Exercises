package Employee_management;

public class Main {
    public static void main(String[] args) {
        EmployeeManagementSystem ems = new EmployeeManagementSystem(5);

        Employee emp1 = new Employee("E001", "Aadi", "Manager", 75000);
        Employee emp2 = new Employee("E002", "Dem", "Developer", 60000);
        Employee emp3 = new Employee("E003", "Abhi", "Designer", 55000);

        ems.add(emp1);
        ems.add(emp2);
        ems.add(emp3);

        System.out.println("All Employees:");
        ems.traverse();

        System.out.println("Search Employee E002:");
        System.out.println(ems.search("E002"));

        System.out.println("Delete Employee E002:");
        ems.delete("E002");

        System.out.println("All Employees after deletion:");
        ems.traverse();
    }
}
