class BankAccount
	@@count = 0
	@interest_rate = 0.01
	@user
	@account_no
	@checking_balance
	@saving_balance

	attr_reader :user, :account_no, :checking_balance, :saving_balance

	def count
		p @@count
		self
	end	

	def user
		p @user
		self
	end 
			
	def account_no
		p @account_no.join("")
		self
	end
	
	def checking_balance
		p @checking_balance	
		self
	end
	
	def saving_balance
		p @saving_balance
		self
	end
	
	def deposit(amt, acct)
		@checking_balance = amt if acct == "checking" 
		@saving_balance = amt if acct == "saving"
		self
	end

	def withdraw(amt, acct)
		if acct == "checking"
			if @checking_balance > amt
				@checking_balance -= amt 
			else puts "Insufficient Funds"	
			end
		end	
		if acct == "saving"
			if @saving_balance > amt
				@saving_balance -= amt
			end
		end	
		self
	end

	def total
		p @checking_balance += @saving_balance
		self
	end

	def account_information
		puts "User name: #{@user}" 
		puts "Account No.: #{@account_no.join("")}"
		puts "Checking Balance: #{@checking_balance}"
		puts "Saving Balance: #{@saving_balance}"
		self
	end	

	private
		def initialize(user)
			@@count += 1
			@user = user
			@account_no = []
			8.times {@account_no.push(rand(0..9))}
			@checking_balance = 0
			@saving_balance = 0
		end		
end	

a = BankAccount.new("Stan")
b = BankAccount.new("Kenny")
c = BankAccount.new("Kyle")
d = BankAccount.new("Cartman")

b.deposit(100, "saving")
b.deposit(200, "checking")

p b

p a.count

c.deposit(600, "checking")
c.withdraw(50, "checking")
c.account_information