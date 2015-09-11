require 'command_factory'

describe CommandFactory do

  let(:command_factory) { command_factory = CommandFactory.new }

  it 'creates a LEFT command' do
    command = command_factory.get_command('LEFT')

    expect(command).to be_an_instance_of LeftCommand
  end

  it 'creates a RIGHT command' do
    command = command_factory.get_command('RIGHT')

    expect(command).to be_an_instance_of RightCommand
  end

  it 'creates a MOVE command' do
    command = command_factory.get_command('MOVE')

    expect(command).to be_an_instance_of MoveCommand
  end

  it 'does not create invalid command' do
    command = command_factory.get_command('WTF')

    expect(command).to be nil
  end

end
