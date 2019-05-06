module total_fertility_rate;

import std.format;
import std.stdio;

struct TotalFertilityRate{
    float[2] age_range = [0,0];
    float fertility_rate = 0;

    bool is_age(float age){
        if(age >= this.age_range[0] && age < this.age_range[1]){
           return true;
        }else{
            return false;
        }
    }

    string toString(){
        return format("%f - %f: %f", this.age_range[0], this.age_range[1], this.fertility_rate);
    }
}

TotalFertilityRate[] tfr_graph = [
    //https://www.singstat.gov.sg/modules/infographics/total-fertility-rate
    {[0,  14], 0},
    {[15, 19], 0.026},
    {[20, 24], 0.145},
    {[25, 29], 0.608},
    {[30, 34], 0.930},
    {[35, 39], 0.484},
    {[40, 44], 0.088},
    {[45, 48], 0.005},
    {[49, 1000], 0}
];

float get_fertility_rate(float age){
    float value = 0;

    foreach(TotalFertilityRate g; tfr_graph){
        if(g.is_age(age)){
            value = g.fertility_rate;
            break;
        }
    }

    return value;
}
