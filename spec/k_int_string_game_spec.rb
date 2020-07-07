require 'k_int_string_game'

describe do
  it 'can run', :aggregate_failures do
    expect(subStringsLessKDist('democracy', 5)).to contain_exactly('cracy', 'ocrac')
    expect(subStringsLessKDist('wawaglknagagwunagkwkwagl', 4)).to contain_exactly('awag', 'gagw', 'gkwk',
                                                                                  'naga', 'wkwa')
  end
end
