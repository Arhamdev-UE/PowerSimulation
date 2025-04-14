UCLASS()
class AFuelTank : AActor
{
    UPROPERTY()
    float FuelAmount = 100.0f;
    UFUNCTION()
    void ConsumeFuel(float DeltaTime)
    {
        FuelAmount -= DeltaTime*5.0f;
        FuelAmount = Math::Max(0.0f,FuelAmount);
    }
    UFUNCTION()
    bool HasFuel() const
    {
        return FuelAmount>0.0f;
    }
    
};