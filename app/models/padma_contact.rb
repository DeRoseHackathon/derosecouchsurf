class PadmaContact

  SELECT = [ :first_name, :last_name, :status, :level, :owner_name]

  # Will search for a student with given email
  # @return [Hash] contact representation
  # TODO @return false if not found
  # @return nil if request fails
  def self.find_student_by_email(email)

    # fetch 1 contact with status student with this email
    response = Typhoeus.get("#{CONTACTS_URL}/v0/contacts",
                 params: {
                  app_key: ENV['contacts_key'],
                  per_page: 1,
                  where: { 
                    email: email,
                    status: 'student'
                  },
                  select: SELECT
                 }
    )

    if response.success?
      response_hash = ActiveSupport::JSON.decode(response.body)
      return response_hash['collection'].first
    else
      nil
    end
  end

  # @return [Hash] contact representation
  # TODO @return false if not found
  # @return nil if request fails
  def self.find(padma_id)
    response = Typhoeus.get("#{CONTACTS_URL}/v0/contacts/#{padma_id}",
                 params: {
                  app_key: ENV['contacts_key'],
                  select: SELECT
                 }
    )
    
    if response.success?
      response_hash = ActiveSupport::JSON.decode(response.body)
      return response_hash
    else
      nil
    end
  end
end
