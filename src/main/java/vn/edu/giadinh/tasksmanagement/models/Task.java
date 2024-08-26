package vn.edu.giadinh.tasksmanagement.models;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import vn.edu.giadinh.tasksmanagement.enums.TaskProgress;
import vn.edu.giadinh.tasksmanagement.enums.TaskStatus;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Setter
public class Task {
  // Fields:
  private int id;
  private String title;
  private String description;
  private TaskStatus status;
  private TaskProgress progress;
  private String responsibility;
  private String tester;

  public Task(String title, String description, TaskStatus status, TaskProgress progress, String responsibility, String tester) {
    this.title = title;
    this.description = description;
    this.status = status;
    this.progress = progress;
    this.responsibility = responsibility;
    this.tester = tester;
  }

  public Task(int id) {
    this.id = id;
  }
}
