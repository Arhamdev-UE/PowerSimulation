UCLASS()
class APowerSource : AActor
{
    UFUNCTION(BlueprintCallable)
    bool IsProvidingPower()
    {
        Print("Error : IsPowerAvailable called on base PowerSource!");
        return false;// Override in child Classes.
    }
};