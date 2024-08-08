package Employee_management;

public class Employee {
    String employeeId;
    String name;
    String position;
    double salary;

    public Employee(String employeeId, String name, String position, double salary) {
        this.employeeId = employeeId;
        this.name = name;
        this.position = position;
        this.salary = salary;
    }

    @Override
    public String toString() {
        return "[employeeId = " + employeeId + ", name = " + name + ", position = " + position + ", salary = " + salary
                + "]";
    }
}
