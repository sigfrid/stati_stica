module StatiStica
  class TDistribution
    require 'yaml' 

    def self.value_for(probability, degrees_of_freedom)
      t_table = YAML::load_file "#{File.dirname __dir__}/tables/t#{probability.to_s[-2,2]}.yml"
      t_table[degrees_of_freedom]
    end
  end
end

