package Task_management;

public class Main {
    public static void main(String[] args) {
        TaskLinkedList taskList = new TaskLinkedList();

        Task task1 = new Task("T001", "Complete Coursera Course", "In Progress");
        Task task2 = new Task("T002", "Learn LLm's", "Not Started");
        Task task3 = new Task("T003", "Prepare for placements", "Completed");

        taskList.add(task1);
        taskList.add(task2);
        taskList.add(task3);

        System.out.println("All Tasks:");
        taskList.traverse();

        System.out.println("Search Task T002:");
        System.out.println(taskList.search("T002"));

        System.out.println("Delete Task T002:");
        taskList.delete("T002");

        System.out.println("All Tasks after deletion:");
        taskList.traverse();
    }
}
