function approach(value, goal, spd, spd_down = spd)
{
    /// Approach(a, b, amount)
    // Moves "a" towards "b" by "amount" and returns the result
    /// @param value
    /// @param goal
    /// @param spd
    
    if (value < goal)
    {
        value += spd;
        if (value > goal)
            return goal;
    }
    else
    {
	
        value -= spd_down;
        if (value < goal)
            return goal;
    }
    return value;
}