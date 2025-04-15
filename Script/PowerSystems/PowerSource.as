UCLASS()
class UPowerSource:AActor
{
    UFUNCTION(BlueprintCallable)
    bool IsPowerAvailable()
    {
        return true;
    }
};