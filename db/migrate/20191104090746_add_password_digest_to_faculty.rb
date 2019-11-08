class AddPasswordDigestToFaculty < ActiveRecord::Migration[6.0]
  def change
    add_column :faculties, :password_digest, :string
  end
end
