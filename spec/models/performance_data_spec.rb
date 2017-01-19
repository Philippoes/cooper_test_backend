require 'rails_helper'

RSpec.describe PerformanceData, type: :model do
  describe 'Database table' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :data }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end
