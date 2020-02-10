# *******************************************************************************
# Honeybee Energy Model Measure, Copyright (c) 2020, Alliance for Sustainable 
# Energy, LLC, Ladybug Tools LLC and other contributors. All rights reserved.
# 
# Redistribution and use in source and binary forms, with or without
# modification, are permitted provided that the following conditions are met:
#
# (1) Redistributions of source code must retain the above copyright notice,
# this list of conditions and the following disclaimer.
#
# (2) Redistributions in binary form must reproduce the above copyright notice,
# this list of conditions and the following disclaimer in the documentation
# and/or other materials provided with the distribution.
#
# (3) Neither the name of the copyright holder nor the names of any contributors
# may be used to endorse or promote products derived from this software without
# specific prior written permission from the respective party.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDER(S) AND ANY CONTRIBUTORS
# "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
# THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
# ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER(S), ANY CONTRIBUTORS, THE
# UNITED STATES GOVERNMENT, OR THE UNITED STATES DEPARTMENT OF ENERGY, NOR ANY OF
# THEIR EMPLOYEES, BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
# EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT
# OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
# STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
# OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# *******************************************************************************
require_relative '../spec_helper'

RSpec.describe FromHoneybee do
  it 'has a version number' do
    expect(FromHoneybee::VERSION).not_to be nil
  end

  it 'has a measures directory' do
    extension = FromHoneybee::Extension.new
    expect(File.exist?(extension.measures_dir)).to be true
  end

  it 'has a files directory' do
    extension = FromHoneybee::Extension.new
    expect(File.exist?(extension.files_dir)).to be true
  end

  # add assertions
  it 'can load schedule fixed interval 1' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_fixedinterval_increasing_fine_timestep.json')
    honeybee_obj_1 = FromHoneybee::ScheduleFixedIntervalAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule fixed interval 2' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_fixedinterval_increasing_single_day.json')
    honeybee_obj_1 = FromHoneybee::ScheduleFixedIntervalAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule fixed interval 3' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_fixedinterval_leap_year.json')
    honeybee_obj_1 = FromHoneybee::ScheduleFixedIntervalAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule fixed interval 4' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_fixedinterval_random_annual.json')
    honeybee_obj_1 = FromHoneybee::ScheduleFixedIntervalAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule primary school occupancy' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_primary_school_occupancy.json')
    honeybee_obj_1 = FromHoneybee::ScheduleRulesetAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  
  it 'can load schedule ruleset office occupance' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_ruleset_office_occupancy.json')
    honeybee_obj_1 = FromHoneybee::ScheduleRulesetAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule ruleset simple repeating' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/schedule_ruleset_simple_repeating.json')
    honeybee_obj_1 = FromHoneybee::ScheduleRulesetAbridged.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

  it 'can load schedule type limit' do
    openstudio_model = OpenStudio::Model::Model.new
    file = File.join(File.dirname(__FILE__), '../samples/schedule/scheduletypelimit_temperature.json')
    honeybee_obj_1 = FromHoneybee::ScheduleTypeLimit.read_from_disk(file)

    object1 = honeybee_obj_1.to_openstudio(openstudio_model)
    expect(object1).not_to be nil
  end

end 