module BuildingBlockRenderer
  class Python
    def self.dependencies(deps)
      { 'code' => "$ pip install #{deps.join(' ')}" }
    end

    def self.run_command(command, _filename, _file_path)
      <<~HEREDOC
        ## Run your code
         Save this file to your machine and run it:
         <pre class="highlight bash"><code>$ #{command}</code></pre>

      HEREDOC
    end

    def self.create_instructions(filename)
      "Create a file named `#{filename}` and add the following code:"
    end

    def self.add_instructions(filename)
      "Add the following to `#{filename}`:"
    end
  end
end
