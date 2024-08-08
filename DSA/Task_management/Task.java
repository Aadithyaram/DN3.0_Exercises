package Task_management;

public class Task {
    String taskId;
    String taskName;
    String status;

    public Task(String taskId, String taskName, String status) {
        this.taskId = taskId;
        this.taskName = taskName;
        this.status = status;
    }

    @Override
    public String toString() {
        return "[taskId = " + taskId + ", taskName = " + taskName + ", status = " + status + "]";
    }
}
