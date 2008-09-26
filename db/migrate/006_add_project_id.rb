class AddProjectId < ActiveRecord::Migration
  def self.up
    add_column :comments, :project_id, :integer, :null => false
   
    execute "alter table comments add constraint fk_comment_projects
    foreign key (project_id) references projects(id)"
  end

  def self.down
    remove_column :comments, :project_id
  end
end
