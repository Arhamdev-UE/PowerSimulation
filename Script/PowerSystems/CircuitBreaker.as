UCLASS()
class ACircuitBreaker : AActor
{
    UPROPERTY()
    bool bIsOn=true;
    UFUNCTION(BlueprintCallable)
    void ToggleBreaker()
    {
        bIsOn=!bIsOn;
        Print("Breaker Toggle: " +bIsOn);
    }
    UFUNCTION(BlueprintCallable)
    bool IsPowerAvailable()
    {
        return bIsOn;
    }
};