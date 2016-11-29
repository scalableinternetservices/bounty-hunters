module TasksHelper
    def cache_key_for_task_row(task)
        "task-#{task.id}"
    end
    
    def cache_key_for_task_table
        "task-table-#{Task.maximum(:updated_at)}"
    end
end
