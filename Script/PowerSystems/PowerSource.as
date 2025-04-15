UCLASS(Abstract)
class APowerSource : AActor
{
    UFUNCTION(BlueprintEvent)
    bool IsProvidingPower()
    {
        Print("Error : IsPowerAvailable called on base PowerSource!");
        return false;// Override in child Classes.
    }
};