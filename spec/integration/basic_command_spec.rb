RSpec.describe "Basic command" do
  context "commands" do
    it "calls basic command" do
      output = `foo version`
      expect(output).to eq("v1.0.0\n")
    end

    it "calls basic command with alias" do
      output = `foo -v`
      expect(output).to eq("v1.0.0\n")

      output = `foo --version`
      expect(output).to eq("v1.0.0\n")
    end

    it "fails for unknown command" do
      result = system("foo unknown")
      expect(result).to be(false)
    end

    context "works with params" do
      it "without params" do
        output = `foo server`
        expect(output).to eq("Server: {}\n")
      end

      it "a param using space" do
        output = `foo server --server thin`
        expect(output).to eq("Server: {:server=>\"thin\"}\n")
      end

      it "a param using equal sign" do
        output = `foo server --host=localhost`
        expect(output).to eq("Server: {:host=>\"localhost\"}\n")
      end

      it "a param using alias" do
        output = `foo server -p 1234`
        expect(output).to eq("Server: {:port=>\"1234\"}\n")
      end

      it "a param with unknown param" do
        output = `foo server --unknown 1234`
        expect(output).to eq("Server: {}\n")
      end

      it "with help param" do
        output = `foo server --help`

command_options_help = <<-DESC
Usage:
  foo server

Description:
  Starts a hanami server

Options:
    -p, --port port                  The port to run the server on
        --server server
        --host host
    -h, --help                       Show this message
DESC
        expect(output).to eq(command_options_help)
      end
    end
  end

  context "subcommands" do
    it "calls subcommand" do
      output = `foo generate model`
      expect(output).to eq("generated model: {}\n")
    end

    it "fails for unknown subcommand" do
      result = system("foo generate unknown")
      expect(result).to be(false)
    end

    context "works with params" do
      it "without params" do
        output = `foo generate model`
        expect(output).to eq("generated model: {}\n")
      end

      it "a param using space" do
        output = `foo generate model --name user`
        expect(output).to eq("generated model: {:name=>\"user\"}\n")
      end

      it "a param using equal sign" do
        output = `foo generate model --name=user`
        expect(output).to eq("generated model: {:name=>\"user\"}\n")
      end

      it "a param using alias" do
        output = `foo generate model -n user`
        expect(output).to eq("generated model: {:name=>\"user\"}\n")
      end

      it "with help param" do
        output = `foo generate model --help`

command_options_help = <<-DESC
Usage:
  foo generate model

Description:
  Generate an entity

Options:
    -n, --name name                  use the name for generating the model
    -h, --help                       Show this message
DESC
        expect(output).to eq(command_options_help)
      end
    end
  end

  context "third-party gems" do
    it "allows to override basic commands" do
      output = `foo hello`
      expect(output).to eq("world\n")
    end

    it "allows to add a subcommand" do
      output = `foo generate webpack`
      expect(output).to eq("generated configuration\n")
    end

    it "allows to override a subcommand" do
      output = `foo generate action`
      expect(output).to eq("generated action\n")
    end
  end

  context "rendering" do
    it "prints first level" do
      output = `foo`

expected_rendering = <<-DESC
Commands:
  foo generate [SUBCOMMAND]  # Generate hanami classes
  foo hello
  foo server                 # Starts a hanami server
  foo version
DESC
      expect(output).to eq(expected_rendering)
    end

    it "prints subcommand's commands" do
      output = `foo generate`

expected_rendering = <<-DESC
Commands:
  foo generate action                    # Generate an action
  foo generate application [SUBCOMMAND]  # Generate hanami applications
  foo generate model                     # Generate an entity
  foo generate webpack
DESC
      expect(output).to eq(expected_rendering)
    end

    it "prints subcommand's subcommand" do
      output = `foo generate application`

expected_rendering = <<-DESC
Commands:
  foo generate application new  # Generate an application
DESC
      expect(output).to eq(expected_rendering)
    end
  end
end
