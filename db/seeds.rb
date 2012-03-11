# encoding: UTF-8
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Emanuel', :city => cities.first)

UserGroup.create( :name => 'Breeder' )
UserGroup.create( :name => 'Groomer' )

['Turkinhoitoaineet', 'Turkinhoitotarvikkeet', 'Koulutus', 'Syötävät',
 'Taluttimet', 'Pannat', 'Valjaat', 'Häkit, boxit, kantolaukut',
 'Makuualustat', 'Trimmauspöydät',
 'Vetoalustat, pentuaitaukset, portit', 'Lelut', 'Muut'].
each do |name|
  TopCategory.create(:name => name)
end