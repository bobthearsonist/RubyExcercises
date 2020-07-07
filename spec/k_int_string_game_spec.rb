require 'k_int_string_game'

describe do
  it 'can run', :aggregate_failures do
    expect(subStringsLessKDist('democracy', 5)).to eq(%w[cracy ocrac])
    expect(subStringsLessKDist('wawahlknagagwunagkwkwagl', 4)).to eq(%w[awag gagw gkwk naga wkwa])
  end
end
