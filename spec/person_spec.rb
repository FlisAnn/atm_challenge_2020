require './lib/person.rb'
require './lib/atm.rb'
require './lib/account.rb'

    describe Person do
        let (:person) { instance_double(
            'Person', 
            name: 'Paulo')}
        
        subject { describe_class.new(name: 'Paulo')}

        it 'is expected to have a :name on initialize' do
            expect(subject.name).not_to be nil
        end

        it 'is expected to raise an error if no name is set' do
            expect { describe_class.new }.to raise_error 'A name is required'
        end
            
        it 'is expected to have :cash attribute with the value of 0 on initialize' do
            expect(subject.cash).to eq 0
        end
        it 'is expected to have a :account attribute' do
            expect(subject.account).to be nil
        end
    end
    describe 'can create an Account' do
        before {subject.create_account}
        it 'of Account Class ' do 
            expect(subject.account).to be_an_instance_of Account
         end

         it 'with himself as an owner' do
            expect(subject.account.owner).to be subject
         end
    end

    describe 'can manage funds if an account been created ' do
    let(:atm) {Atm.new}

        before {subject.create_account}
        it 'can deposit funds' do
            expect(subject.deposit(100)).to be_truthy
        end

        describe 'can not manage funds if no account been created' do
        it 'can\'t deposit funds' do
            expect { subject.deposit(100) }.to raise_error(RuntimeError, 'No account present')   
        
        end
    end
end