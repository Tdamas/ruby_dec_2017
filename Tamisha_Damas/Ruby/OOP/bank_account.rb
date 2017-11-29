class BankAccount
  attr_reader :account_number, :checking, :saving

  @@number_of_accounts = 0
  def initialize
    @account_number = new_account
    @checking = 0
    @saving = 0
    @@number_of_accounts += 1
    @interest_rate += 0.01
  end

  def deposit(account, amount)
    if account.downcase == "checking"
      @checking += amount
      puts "You have insufficient"
    else
      @saving += amount
    end
  end

  def withdrawl(account, number)
    if account.downcase == "checking"
      if @checking - amount < 0
        puts "You have insufficient funds for the amount of $#{@checking}"
      else
        @checking -= amount
      end
    else
      if @saving - amount < 0
        puts "You have insufficient funds for the amount of $#{@saving}"
      else
        @savings -= amount
      end
    end
  end

  def total
    "Checking Balance: #{@checking}\nSaving Balance: #{@saving}\nTotal Balance: #{@checking + @saving}"
  end

  def account_information
    "Account Number: #{@account_number}\nInterest Rate: #{@interest_rate}\n#{self.total}"
  end

  def self.number_of_accounts
    @@number_of_accounts
  end

  private
  def new_account
    Account.new(9) { rand(1..9)}.join
  end
end
