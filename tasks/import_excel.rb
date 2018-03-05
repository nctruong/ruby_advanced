# using roo & activerecord-import
# roo for reading excel
# activerecord-import for batch import

# code sample
require 'roo'

module VesselServices
  class ImportExcel
    # Template
    # Row starting from 1
    # Col starting from 0

    START_DATA_ROW = 5.freeze

    VESSEL_CODE_COL = 0.freeze
    BUILT_YEAR_COL = 6.freeze
    SHIPYARD_COL = 7.freeze
    CLASSIFICATION_COL = 9.freeze
    TEU_SIZE_COL = 10.freeze
    MAIN_ENGINE_TYPE = 85.freeze
    HOLDING_TYPE2_COL = 365.freeze

    def initialize(file)
      @file = file
      @imported_list = []
      @import_vessels = []
    end

    def import!
      xlsx = Roo::Spreadsheet.open(@file, extension: :xlsx)
      data_sheet = xlsx.sheet(0)

      vessels = {}

      (VesselServices::ImportExcel::START_DATA_ROW..data_sheet.last_row).each do |row_index|
        vessel_code = data_sheet.row(row_index)[VesselServices::ImportExcel::VESSEL_CODE_COL]
        vessels[vessel_code] = read_vessel_data_from_file(data_sheet, row_index)
      end

      vessel_codes = vessels.keys

      Vessel.where(code: vessel_codes).find_each do |vessel|
        update_vessel_info(vessel, vessels[vessel.code])
      end

      Vessel.import(@import_vessels,  on_duplicate_key_update: {conflict_target: [:id], columns: [:built_year, :shipyard, :classification, :teu_size, :main_engine_type, :holding_type2]})

      return @imported_list, vessel_codes - @imported_list
    end

    private

    def read_vessel_data_from_file(data_sheet, row_index)
      {
          built_year: data_sheet.row(row_index)[VesselServices::ImportExcel::BUILT_YEAR_COL].to_i,
          shipyard: data_sheet.row(row_index)[VesselServices::ImportExcel::SHIPYARD_COL],
          classification: data_sheet.row(row_index)[VesselServices::ImportExcel::CLASSIFICATION_COL],
          teu_size: data_sheet.row(row_index)[VesselServices::ImportExcel::TEU_SIZE_COL],
          main_engine_type: data_sheet.row(row_index)[VesselServices::ImportExcel::MAIN_ENGINE_TYPE],
          holding_type2: data_sheet.row(row_index)[VesselServices::ImportExcel::HOLDING_TYPE2_COL]
      }
    end

    def update_vessel_info(vessel, data)
      vessel.built_year = data[:built_year]
      vessel.shipyard = data[:shipyard]
      vessel.classification = data[:classification]
      vessel.teu_size = data[:teu_size]
      vessel.main_engine_type = data[:main_engine_type]
      vessel.holding_type2 = data[:holding_type2]

      @imported_list.push(vessel.code)
      @import_vessels.push(vessel)
    end

  end
end
