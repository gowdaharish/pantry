#pragma once

#include "food_item.h"

#include <QAbstractListModel>

class PantryModel : public QAbstractListModel
{
    Q_OBJECT
public:
    PantryModel(QObject* parent = nullptr);

    enum PantryRoles
    {
        NameRole = Qt::UserRole + 1,
        ExpiryDaysRole,
    };
    Q_ENUMS(PantryRoles)

    int rowCount(const QModelIndex& parent = QModelIndex()) const override;
    QVariant data(const QModelIndex& index, int = Qt::DisplayRole) const override;
    bool setData(const QModelIndex& index, const QVariant& value, int role = Qt::EditRole) override;

    Q_INVOKABLE void addFoodItem(const QString& name, const QString& exp);
    Q_INVOKABLE void updateFoodItem(const QModelIndex& index, const QString& name, const QString& exp);
    Q_INVOKABLE void deleteFoodItem(const int index);

protected:
    QHash<int, QByteArray> roleNames() const override;

private:
    QVector<FoodItem*> _foodItems;
};
