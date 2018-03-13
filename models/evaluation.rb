class Evaluation < ApplicationRecord
  include Closable
  include AASM
  include EvaluationStatusConcern

  after_save :generate_evaluation_items!

  has_many :evaluation_items
  has_many :evaluation_item_inspection_items,
            through: :evaluation_items,
            source: :inspection_item
  has_many :evaluation_item_inspection_item_inspection_categories,
            through: :evaluation_item_inspection_items,
            source: :inspection_category
  has_many :evaluation_item_inspection_item_inspection_locations,
            through: :evaluation_item_inspection_items,
            source: :inspection_location
  has_many :documents

  has_one :corrective_action_report, -> { where attachable_type: 'EvaluationCorrectiveActionReport'},
         class_name: S3Attachment.name, foreign_key: :attachable_id,
         foreign_type: :attachable_type, dependent: :destroy

  has_one :boarding_record, -> { where attachable_type: 'EvaluationBoardingRecord'},
         class_name: S3Attachment.name, foreign_key: :attachable_id,
         foreign_type: :attachable_type, dependent: :destroy

  has_one :corrective_action_report, -> { where attachable_type: 'EvaluationCorrectiveActionReport'},
         class_name: S3Attachment.name, foreign_key: :attachable_id,
         foreign_type: :attachable_type, dependent: :destroy

  has_one :boarding_record, -> { where attachable_type: 'EvaluationBoardingRecord'},
         class_name: S3Attachment.name, foreign_key: :attachable_id,
         foreign_type: :attachable_type, dependent: :destroy

  has_one :deck

  belongs_to :company
  delegate   :name, to: :company, prefix: :company

  belongs_to :primary_auditor,
              class_name: 'Auditor',
              touch: true

  belongs_to :secondary_auditor,
              class_name: 'Auditor',
              touch: true

  belongs_to :approver,
              class_name: 'User',
              touch: true

  belongs_to :vessel

  belongs_to :port

  validates :score,
            allow_nil: true,
            numericality: { less_than_or_equal_to: 100 }

  validate :primary_auditor_and_secondary_auditor_can_not_be_same

  accepts_nested_attributes_for :evaluation_items
  accepts_nested_attributes_for :corrective_action_report
  accepts_nested_attributes_for :boarding_record
  accepts_nested_attributes_for :deck
  accepts_nested_attributes_for :engine

  delegate :name, to: :vessel, prefix: true
  delegate :name, to: :company, prefix: true
  delegate :name, to: :port, prefix: true, allow_nil: true
  delegate :name, to: :approver, prefix: true, allow_nil: true
  delegate :name, to: :primary_auditor, prefix: true, allow_nil: true
  delegate :name, to: :secondary_auditor, prefix: true, allow_nil: true
  delegate :name, to: :approver, prefix: true, allow_nil: true

  def scheduled_date_formatted
    return if scheduled_date.nil?
    if self.candidate?
      DateServices::Format.new(self.scheduled_date).print_full_month_and_year
    else
      DateServices::Format.new(self.scheduled_date).print_year_month_day
    end
  end

  def scheduled_date_formatted=(val)
    self.scheduled_date = Date.strptime(val, '%Y/%m/%d') unless val.blank?
  end

  def scheduled_month_year_formatted
    self.scheduled_date.strftime('%Y/%m') unless scheduled_date.nil?
  end

  def scheduled_month_year_formatted=(val)
    self.scheduled_date = Date.strptime(val, '%Y/%m') unless val.blank?
  end

  def generate_evaluation_items!
    return if self.evaluation_items.any?

    evaluation_items = InspectionItem.open.map do |inspection_item|
      EvaluationItem.new(evaluation: self, inspection_item: inspection_item)
    end

    EvaluationItem.import(evaluation_items, validate: false)
  end

  private

  def primary_auditor_and_secondary_auditor_can_not_be_same
    return if primary_auditor_id.nil? || secondary_auditor_id.nil?
    return unless primary_auditor_id == secondary_auditor_id
    self.errors.add(:base, 'Primary Auditor and Secondary Auditor can not be same.')
  end
end
