module App
    classes = %w[login home]
    classes.each do |klass|
      define_method :"#{klass}" do
        instance_variable_set("@#{klass}", klass.camelize.constantize.new) if instance_variable_get("@#{klass}").nil?
        instance_variable_get("@#{klass}")
      end
    end
  end
  World(App)