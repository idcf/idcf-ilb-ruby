module Idcf
  module Ilb
    module ClientExtensions
      # SDK APIs for job resource
      module Job
        # Get list of existing jobs
        #
        # @param attributes [Hash] request attributes
        # @option attributes [String] :resource name of resource (optional)
        # @option attributes [String] :method name of http method (optional)
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def list_jobs(attributes = {}, headers = {})
          Validators::Job.validate_attributes!(attributes, :list)
          get!("jobs", attributes, headers)
        end

        # Get a job
        #
        # @param id [String] ID of target job
        # @param headers [Hash] HTTP request headers
        # @return [Response] HTTP response object
        def get_job(id, headers = {})
          get!("jobs/#{id}", {}, headers)
        end

        # Check job result
        # Get a resource data
        #
        # @param id [String] ID of target job
        # @return [Response] HTTP response object
        def check_job(id, headers = {}, callback_and_args = [], specify_res_id = true)
          flag = false
          1.upto(20) do |n|
            @res = get_job(id, headers)
            if @res.body["job_status"] == "Success"
              flag = true
              break
            elsif @res.body["job_status"] == "Failed"
              raise(
                ApiError,
                "API Failed."
              )
            else
              sleep 2 * n
            end
          end

          return if "DELETE" == @res.body["method"]
          if flag == true
            if specify_res_id == true
              res_id = @res.body["resource_id"]
              callback_and_args << res_id
            end
            callback_and_args.empty? ? true : __send__(*callback_and_args, headers)
          else
            raise(
              ApiError,
              "JOB Timeout."
            )
          end
        end

        # Get an array of existing job objects.
        #
        # @param headers [Hash] HTTP request headers
        # @return [Array<Resources::Job>] An array of job objects
        def jobs(headers = {})
          list_jobs(headers).resources.map do |job|
            Resources::Job.new(self, job)
          end
        end
      end
    end
  end
end
