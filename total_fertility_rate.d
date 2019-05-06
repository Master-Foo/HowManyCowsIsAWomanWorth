module total_fertility_rate;

import std.format;
import std.stdio;

struct TotalFertilityRate{
    float age = 0;
    float fertility_rate = 0;

    bool is_age(float age){
        if(age >= this.age && age < this.age+5){
           return true;
        }else{
            return false;
        }
    }

    string toString(){
        return format("%f %f", this.age, this.fertility_rate);
    }
}

TotalFertilityRate[] tfr_graph = [
    //https://www.singstat.gov.sg/modules/infographics/total-fertility-rate
    {10, 0},
    {15, 0.026},
    {20, 0.145},
    {25, 0.608},
    {30, 0.930},
    {35, 0.484},
    {40, 0.088},
    {45, 0.005},
    {49, 0}
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
