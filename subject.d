module subject;

import std.conv;
import std.format;
import std.math;

struct Subject{
    string  name            = "";
    int     age             = 0;
    int     children        = 0;
    float   hotness         = 0;
    float   skin_albedo     = .6;
    float   net_worth       = 0;
    float   cow_value       = 500;
    float   divorces        = 0;

    float calculate_children(){
        int modifier = 10;
        return this.children * modifier;
    }

    float calculate_divorces(){
        int modifier = -10;

        return pow(this.divorces,2) * modifier;
    }

    float calculate_fertility(){
        //https://www.singstat.gov.sg/modules/infographics/total-fertility-rate

        double modifier = 10;
        double value = 0;
        double[8] ageArray = [49, 45, 40, 35, 30, 25, 20, 15];
        double[8] bptArray = [0, 0.005, 0.088, 0.484, 0.930, 0.608, 0.145, 0.026];

        if (this.age < ageArray[7] || this.age > ageArray[0]) value = bptArray[0];
        else if (this.age >= ageArray[1]) value = bptArray[1];
        else if (this.age >= ageArray[2]) value = bptArray[2];
        else if (this.age >= ageArray[3]) value = bptArray[3];
        else if (this.age >= ageArray[4]) value = bptArray[4];
        else if (this.age >= ageArray[5]) value = bptArray[5];
        else if (this.age >= ageArray[6]) value = bptArray[6];
        else value = bptArray[7];

        return to!float(value * modifier);
    }

    float calculate_hotness(){
        float min = 0;
        float max = 10;
        int modifier = 10;

        return normalize(this.hotness, min, max) * modifier;
    }

    float calculate_skin_albedo(){
        float min = .05;
        float max = .6;
        int modifier = 10;

        return this.normalize(this.skin_albedo, min, max) * modifier;
    }

    float calculate_net_worth(){
        return this.net_worth / this.cow_value;
    }

    float calculate_value(){
        return (
            this.calculate_skin_albedo +
            this.calculate_children +
            this.calculate_fertility +
            this.calculate_hotness +
            this.calculate_divorces +
            this.calculate_net_worth
        );
    }

    string toString() {
        return format("%s is worth %f cows.", this.name, this.calculate_value() );
    }

    float normalize(float x, float min, float max){
        return (x < min || x > max) ? 0 : (x - min) / (max - min);
    }
}
