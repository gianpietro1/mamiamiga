class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

    def scope
      record.class  # simplified scope
    end
    
    def index?
      true
    end

    def show?
      true
    end

    def edit?
      user.present? && (record.user == user || user.admin?)
    end

    def new?
      user.present? && (user.blogger? || user.admin?)
    end

    def create?
      new?
    end
    
    def update?
      edit?
    end
    
    def destroy
      edit?
    end
 
end
