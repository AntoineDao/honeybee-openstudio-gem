# *******************************************************************************
# Ladybug Tools Energy Model Schema, Copyright (c) 2019, Alliance for Sustainable 
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

require 'ladybug/energy_model/model_object'

require 'json-schema'
require 'json'
require 'openstudio'

module Ladybug
  module EnergyModel      
    class EnergyMaterial < ModelObject
      attr_reader :errors, :warnings

      def initialize(hash)
        super(hash)

        raise "Incorrect model type '#{@type}'" unless @type == 'EnergyMaterial'
      end
      
      private
      
      def find_existing_openstudio_object(openstudio_model)
        object = openstudio_model.getStandardOpaqueMaterialByName(@hash[:name]) 
        if object.is_initialized
          return object.get
        end
        return nil
      end
      
      def create_openstudio_object(openstudio_model)
        openstudio_opaque_material = OpenStudio::Model::StandardOpaqueMaterial.new(openstudio_model) 
        openstudio_opaque_material.setName(@hash[:name]) 
        if @hash[:roughness]  
          openstudio_opaque_material.setRoughness(@hash[:roughness])
        else 
          openstudio_opaque_material.setRoughness(@schema[:EnergyMaterial][:roughness][:default])
        end      
        openstudio_opaque_material.setThickness(@hash[:thickness])
        openstudio_opaque_material.setConductivity(@hash[:conductivity])
        openstudio_opaque_material.setDensity(@hash[:density])
        openstudio_opaque_material.setSpecificHeat(@hash[:specific_heat])
        if @hash[:thermal_absorptance]
          openstudio_opaque_material.setThermalAbsorptance(@hash[:thermal_absorptance].to_f)
        else 
          openstudio_opaque_material.setThermalAbsorptance(@schema[:EnergyMaterial][:thermal_absorptance][:default].to_f)
        end
        if @hash[:solar_absorptance]
          openstudio_opaque_material.setSolarAbsorptance(@hash[:solar_absorptance].to_f)
        else 
          openstudio_opaque_material.setSolarAbsorptance(@schema[:EnergyMaterial][:solar_absorptance][:default].to_f)
        end
        if @hash[:visible_absorptance]
          openstudio_opaque_material.setVisibleAbsorptance(@hash[:visible_absorptance].to_f)
        else 
          openstudio_opaque_material.setVisibleAbsorptance(@schema[:EnergyMaterial][:visible_absorptance][:default].to_f)
        end
        return openstudio_opaque_material
      end

    end # EnergyEnergyMaterial
  end # EnergyModel
end # Ladybug
