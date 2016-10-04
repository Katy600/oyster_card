require_relative 'station'

class Oystercard

  attr_reader :balance, :entry_station

  MONEY_LIMIT = 90
  MINIMUM_BALANCE = 1
  FARE = 1


  def initialize
    @balance = 0
    @in_journey = false
  end

  def top_up(money)
    fail "Card limit is #{Oystercard::MONEY_LIMIT}." if money + @balance > Oystercard::MONEY_LIMIT
    @balance += money
  end



  def touch_in(station)
    fail "Insufficient funds for journey" if @balance < MINIMUM_BALANCE
    @in_journey = true
    @entry_station = station
  end

  def touch_out
    @in_journey = false
    deduct(FARE)
    @entry_station = nil
  end

  def in_journey?
    @in_journey
  end



private

  def deduct(fare)
    @balance-= fare
  end


end