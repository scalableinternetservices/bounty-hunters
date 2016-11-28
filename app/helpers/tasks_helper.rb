module TasksHelper
    def cache_key_for_task_row(task)
        "task-#{task.id}"
    end
end
