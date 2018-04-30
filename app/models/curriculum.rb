class Curriculum < ApplicationRecord
  has_many :subject

  def label_for_select
    "#{name} (#{period}) "
  end


end
