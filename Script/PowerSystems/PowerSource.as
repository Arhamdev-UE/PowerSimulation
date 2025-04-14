UCLASS(Abstract)
class UPowerSource:UObject
{
    UFUNCTION(BlueprintCallable)
    bool IsPowerAvailable()
    {
        return true;
    }
};